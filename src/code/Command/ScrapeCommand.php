<?php

namespace TickX\Scraper\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class ScrapeCommand extends Command
{
    protected function configure()
    {
        $this->setName('scrape');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        // TODO: Write your code here
        $output->writeln("Hello TickX!");

        return 0;
    }
}
