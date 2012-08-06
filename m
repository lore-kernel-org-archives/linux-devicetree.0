From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: DT GPIO numbering?
Date: Sun, 05 Aug 2012 20:18:19 -0600
Message-ID: <501F296B.4070004@wwwdotorg.org>
References: <20120801152240.GA16388@sig21.net> <CACRpkdZryc95WpSXddCrLvZGDsv4x-ndX9XcVzoxaDCT53AFLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZryc95WpSXddCrLvZGDsv4x-ndX9XcVzoxaDCT53AFLw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johannes Stezenbach <js@sig21.net>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/05/2012 04:06 AM, Linus Walleij wrote:
> On Wed, Aug 1, 2012 at 5:22 PM, Johannes Stezenbach <js@sig21.net> wrote:
> 
>> I'm currently learning how Linux devicetree support works,
>> here is one question I couldn't find an answer for.
>>
>> I understand that within the devicetree GPIOs are referenced by phandle,
>> thus the numbers are irrelevant.  However, in sysfs the number is
>> what is used to access the GPIO, e.g. for debugging or
>> blinkenlight apps.  How does this fit together?
> 
> I think it simply does not fit together.
> 
> Grant & me has been claiming the GPIO sysfs interface is a bit
> crazy from time to time.
> 
> My long-term plan would be to replace it with /dev/gpio/gpioN
> device nodes per-gpiochip and use ioctl etc to control these
> beasts instead. However one does not do that overnight,
> and my life is too busy, and other refactorings also need to
> happen :-/

I can't comment on the sysfs-vs-dev interface location, but I don't
think it addresses Johannes' issue; finding out which GPIO IDs are
provided by which devices.

Perhaps in each device's sysfs node, there should be some information
re: which GPIO range it provides. Right now, perhaps a text file with
the GPIO base it it. With the new /dev interface you mention above,
perhaps a symlink to the /dev file, or a file containing the /dev file's
major/minor number. Or, is there such a thing already (other than
debugfs's gpio file).
