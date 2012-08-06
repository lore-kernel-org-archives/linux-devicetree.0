From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: DT GPIO numbering?
Date: Mon, 06 Aug 2012 19:10:00 +0800
Message-ID: <501FA608.1030805@firmworks.com>
References: <20120801152240.GA16388@sig21.net>
 <CACRpkdZryc95WpSXddCrLvZGDsv4x-ndX9XcVzoxaDCT53AFLw@mail.gmail.com>
 <501F296B.4070004@wwwdotorg.org>
 <CACRpkdZ8AO5SrjJvJxvpauEadQOKMNaW_Pxxzhjk5hWnVB1b+g@mail.gmail.com>
 <20120806095805.GA16607@sig21.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120806095805.GA16607-FF7aIK3TAVNeoWH0uzbU5w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Johannes Stezenbach <js-FF7aIK3TAVNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 8/6/2012 5:58 PM, Johannes Stezenbach wrote:
> On Mon, Aug 06, 2012 at 08:35:51AM +0200, Linus Walleij wrote:
>> On Mon, Aug 6, 2012 at 4:18 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>
>>> I can't comment on the sysfs-vs-dev interface location, but I don't
>>> think it addresses Johannes' issue; finding out which GPIO IDs are
>>> provided by which devices.
>>>
>>> Perhaps in each device's sysfs node, there should be some information
>>> re: which GPIO range it provides. Right now, perhaps a text file with
>>> the GPIO base it it.
>>
>> Yes that could work ...
> 
> The method used by the gpio-mxs.c driver (of_alias_get_id)
> would also work.  The question is which method is preferable.
> 
> Ideally I would like to use DT attributes to identify my GPIOs
> in the same way as they appear in the schematics.  E.g.
> one device may have GPIOs called PORT_A.0 to PORT_A.7,
> another one may be EXT.0 to EXT.15.  But a single integer ID
> is good enough since GPIO usage is platform specific anyway.
> However, the mapping must be static and not depend e.g. on
> module load order like now if you use pl061 and some i2c GPIO.
> Software must be able to rely on that e.g. GPIO ID 11
> always refers to EXT.3.

There is precedence for a "slot-names" property that correlates specific
hardware entities with physical labels.  It has been applied to PCI
plug-in slots and to other devices.  See, for example,
http://www.openfirmware.org/1275/proposals/Closed/Accepted/381-it.txt


> 
> 
>>> With the new /dev interface you mention above,
>>> perhaps a symlink to the /dev file, or a file containing the /dev file's
>>> major/minor number. Or, is there such a thing already (other than
>>> debugfs's gpio file).
>>
>> Nothing I know of, but yes the day we come up with something,
>> it needs to be backward-compatible some way.
>>
>> The problem is that there is really no reference userspace
>> like "lsgpio" or so. Maybe the first step could be to create that.
> 
> I don't know much about OpenWrt, but I've seen they have
> something:
> https://dev.openwrt.org/browser/trunk/target/linux/generic/files/drivers/char/gpio_dev.c
> https://dev.openwrt.org/browser/trunk/target/linux/generic/files/include/linux/gpio_dev.h
> https://dev.openwrt.org/browser/trunk/package/gpioctl/src/main.c
> 
> 
> Johannes
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
> 
