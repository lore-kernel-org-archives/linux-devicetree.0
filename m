From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Thu, 19 Feb 2015 13:46:13 +0100
Message-ID: <0440c296085f48918e07134b07690a08@BY2FFO11FD028.protection.gbl>
References: <20150113222450.GA17475@obsidianresearch.com>
 <alpine.DEB.2.02.1501150936390.16760@linuxheads99>
 <20150115184726.GA23247@obsidianresearch.com>
 <20150115204502.591bca1d@lxorguk.ukuu.org.uk>
 <A3B5BC9B-EB88-4C0E-B235-E9C86D23DC34@konsulko.com>
 <20150121160151.453ba403@lxorguk.ukuu.org.uk>
 <D466D9FF-25DA-4765-9469-128733BEBC4D@konsulko.com>
 <20150121202700.GB4942@obsidianresearch.com> <20150215224006.GA5626@amd>
 <54E37569.80508@landley.net> <20150217191727.GA18429@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150217191727.GA18429@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>, Rob Landley <rob@landley.net>
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, atull <atull@opensource.altera.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, philip@balister.org, rubini@gnudd.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, Felipe Balbi <balbi@ti.com>, m.chehab@samsung.com, davidb@codeaurora.org, davem@davemloft.net, cesarb@cesarb.net
List-Id: devicetree@vger.kernel.org

On 02/17/2015 08:17 PM, Pavel Machek wrote:
> On Tue 2015-02-17 11:07:53, Rob Landley wrote:
>>
>>
>> On 02/15/2015 04:40 PM, Pavel Machek wrote:
>>> On Wed 2015-01-21 13:27:00, Jason Gunthorpe wrote:
>>>> On Wed, Jan 21, 2015 at 06:33:12PM +0200, Pantelis Antoniou wrote:
>>>> My point is that the current firmware layer is overly cautious and
>>>> FPGAs are very big. My current project on small Xilinx device has a
>>>> 10MB programming file. The biggest Xilinx device today has a max
>>>> bitfile size around 122MB.
>>>>
>>>> So keeping that much memory pinned in the kernel when I can prove it
>>>> is uncessary for my system (either because there is no suspend/resume
>>>> possibility, or because I know the CPU can always access the
>>>> filesytem) is very undesirable.
>>>
>>> Well, your current device aalso has 1GB RAM, no?
>>
>> Unnecessarily pinning 10% of your ram is a good solution?
> 
> Never said that. But I'd rather have _some_ API proposed, then try to
> design in everthing including kitchen sink and do nothing.

+1 on this.

Thanks,
Michal
