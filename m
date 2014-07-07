From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4 0/3] Add R8A7791/Koelsch/Henninger board PCI DT support
Date: Tue, 08 Jul 2014 01:21:50 +0400
Message-ID: <53BB0F6E.5080600@cogentembedded.com>
References: <201406242207.32790.sergei.shtylyov@cogentembedded.com> <9076479.78BOG4SjZ9@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <9076479.78BOG4SjZ9@wuerfel>
Sender: linux-sh-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, horms@verge.net.au
Cc: Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux@arm.linux.org.uk, magnus.damm@gmail.com
List-Id: devicetree@vger.kernel.org

Hello.

On 06/24/2014 10:22 PM, Arnd Bergmann wrote:

>>     Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
>> 'renesas-devel-v3.16-rc2-20140623' tag. Here we add PCI USB device tree support
>> for the R8A7791-based Koelsch and Henninger boards. As the 'pci-rcar-gen2'
>> driver device tree support has been merged for 3.16, this patchset can now be
>> merged too...

>> [1/3] ARM: shmobile: r8a7791: add internal PCI bridge nodes
>> [2/3] ARM: shmobile: koelsch: enable internal PCI
>> [3/3] ARM: shmobile: henninger: enable internal PCI

> Acked-by: Arnd Bergmann <arnd@arndb.de>

    Simon, what's up with this series? You've merged analogous series for 
R8A7790 but not this one. You followed up to an older version of it, asking me 
to re-post when the driver patch gets merged but it already had been merged 
already (and this version posted), and I got no reply from you then...

WBR, Sergei

