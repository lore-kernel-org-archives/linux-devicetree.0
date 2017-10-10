From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Oct 9th (of: unittest: testcases)
Date: Tue, 10 Oct 2017 10:33:22 -0700
Message-ID: <7524d1e5-137c-cb78-c24f-6a9701e46701@infradead.org>
References: <20171009212122.wx4lgnecmqyzuywq@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171009212122.wx4lgnecmqyzuywq@sirena.co.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/09/17 14:21, Mark Brown wrote:
> For my birthday I've gone and got myself a linux-next tree:
> 
> Changes since 20170929:
> 
> The net-next and drm trees lost their build failures but the rcu tree
> gained one.


I don't know what this is but it's new AFAIK.
(seen on i386 and x86_64)


  DTC     drivers/of/unittest-data/testcases.dtb
drivers/of/unittest-data/testcases.dtb: Warning (interrupts_extended_property): Could not get phandle node for /__local_fixups__/testcase-data/interrupts/interrupts-extended0:interrupts-extended(cell 3)
drivers/of/unittest-data/testcases.dtb: Warning (interrupts_property): interrupts size is (4), expected multiple of 8 in /testcase-data/testcase-device2



-- 
~Randy
