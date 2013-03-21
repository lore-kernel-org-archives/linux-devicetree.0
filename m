From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH V2 2/2] of: remove /proc/device-tree
Date: Thu, 21 Mar 2013 20:07:18 +0000
Message-ID: <CACxGe6vSywW_iekAKmDMf5_TLLt5Hn+Jttq8kddq3vJ=AE+DQA@mail.gmail.com>
References: <1363865097-32764-1-git-send-email-grant.likely@secretlab.ca>
 <1363865097-32764-3-git-send-email-grant.likely@secretlab.ca> <1363870366.3312.1.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363870366.3312.1.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Miller <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 21, 2013 at 12:52 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Thu, 2013-03-21 at 11:24 +0000, Grant Likely wrote:
>> The same data is now available in sysfs, so we can remove the code
>> that exports it in /proc and replace it with a symlink to the sysfs
>> version.
>>
>> Tested on versatile qemu model and mpc5200 eval board. More testing
>> would be appreciated.
>
> This should be delayed until we are 100% confident that the sysfs
> variant is totally backward compatible with anything that messes around
> with /proc/device-tree.

Yup, I agree with that.

> kexec comes to mind (all 4 variants of fs2dt.c (yuck !)), dtc, various
> powerpc-utils (bootloader configuration etc...), and more.
>
> We also need to test the new code with hotplug, I'll see if I can get
> somebody at IBM to give it a spin.

Thanks

g.
