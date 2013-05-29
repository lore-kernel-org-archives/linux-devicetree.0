From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] fdt: Enhance dts/Makefile to be all things to all men
Date: Wed, 29 May 2013 10:40:45 -0600
Message-ID: <51A62F8D.9010208@wwwdotorg.org>
References: <1369769778-12455-1-git-send-email-sjg@chromium.org>
 <51A51A50.4050308@wwwdotorg.org>
 <CAPnjgZ04BKhQtpJct9tvN8rW5Wae+6fxxOOQDnEkmgrr-mAfwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ04BKhQtpJct9tvN8rW5Wae+6fxxOOQDnEkmgrr-mAfwg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: u-boot-review <u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/29/2013 09:59 AM, Simon Glass wrote:
> Hi Stephen,
> 
> On Tue, May 28, 2013 at 1:57 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 05/28/2013 01:36 PM, Simon Glass wrote:
>>> There are a few partially conflicting requirements in compiling the device
>>> tree, since U-Boot relies on whatever is installed on the build machine.
>>>
>>> Some versions of dtc support -i, and this is often better than using #include
>>> since you get correct line number information in errors.
>>
>> What issue is there with line numbers when using dtc? Recent dtc
>> supports #line directives from the pre-processing results, and hence
>> reports errors in terms of the source files, just like raw dtc without cpp.
> 
> That's the issue. What does dtc v1.3 do?

v1.3 doesn't include the feature, but it also doesn't support -i either.

>>> Unfortunately this
>>> version must be installed manually in current Linux distributions.
>>
>> Well, then that gets into the problem of some .dts files choosing to use
>> /include/ and rely on -i, but others using #include and not. I don't
>> really think it's a good idea to propagate both versions. Picking one
>> and using it would be far better.
>>
>> I really do think we should simply require a reasonably recent dtc and
>> be done with it.
> 
> I would be happy with that, but it can be an extra barrier to getting
> U-Boot building.

The Linux kernel chose to solve this by bundling the required dtc source
inside the kernel source tree as a tool. This seems by far the simplest
way to solve the problem for U-Boot too. If not, it's not exactly hard to:

git clone
make

... given that one is already building U-Boot from source anyway.


> So do we need using #include at all if we are using -i ?

Well, *.dts are moving to #include (and other cpp constructs) rather
than /include/ in the copies in the Linux kernel, which I think will
eventually make their way into U-Boot for consistency. Equally, if/when
*.dts get separated out into a separate project from the kernel, I think
we'd want the same to happen for U-Boot so that the same *.dts is used.
Then, there won't be a choice.

>>> Some device tree files use the word 'linux' which gets replaced with '1' by
>>> many version of gcc, including version 4.7. So undefine this.
>>
>> Linux chose to use -undef rather than undefining specific/individual
>> defines. It'd be best to be consistent to that .dts files are more
>> likely to be portable between the two.
> 
> Seems a bit extreme, but OK. Are you worried that gcc defines other
> things without the double underscore?

IIRC there were some other issues, yes. "unix" may have been one of
them. The problem was reported (and I think that fix suggested) by
someone else, so I don't remember the full details, although they're in
the mailing list archives I suppose.

>>> diff --git a/dts/Makefile b/dts/Makefile

>>>               -DARCH_CPU_DTS=\"$(SRCTREE)/arch/$(ARCH)/dts/$(CONFIG_ARCH_DEVICE_TREE).dtsi\" \
>>>               -DBOARD_DTS=\"$(SRCTREE)/board/$(VENDOR)/$(BOARD)/dts/$(DEVICE_TREE).dts\" \
>>> -             -I$(SRCTREE)/board/$(VENDOR)/dts -I$(SRCTREE)/arch/$(ARCH)/dts
>>> +             -D__ASSEMBLY__ -I$(OBJTREE)/include -I$(SRCTREE)/include \
>>> +             -I$(OBJTREE)/include2 \
>>
>> Do we really want include or include2 (what's that?) at all? The .dts
>> files really should be standalone, and not interact with the U-Boot
>> headers at all.
> 
> I understood that you were wanting to make use of U-Boot defines. If
> you want to include include/config.h then I think you need these.

I hope I didn't want to:-) The DT should really represent the HW not
anything about the way U-Boot is configured.

>>> +             -include $(OBJTREE)/include/config.h
>>> +
>>> +DTS_TMP := $(OBJTREE)/include/generated/$(DEVICE_TREE).dts.in
>>
>> Hmm. This really isn't a generated header file. Can this instead be
>> $(OBJTREE)/$(dir $@).$(notdir $@).dts or something like that?
> 
> I didn't say header file.
> 
> The nice thing about having everything in include/generated is that it
> doesn't pollute the source for in-tree builds.

Well, it's in a directory that's for generated headers; it has
"/include/" in the path. I don't think we should put it somewhere that C
code could accidentally #include it, irrespective of how (un-)likely
that is to get passed review. Also, for in-tree builds, doesn't every
single other derived file get put into the source tree? I'm not sure why
this file would need to be special?

>>> +$(DT_BIN): $(TOPDIR)/$(DTS_SRC)
>>>       rc=$$( \
>>> -             cat $< | $(CPP) -P $(DTS_CPPFLAGS) - | \
>>> -             { { $(DTC) -R 4 -p 0x1000 -O dtb -o ${DT_BIN} - 2>&1 ; \
>>> +             cat $< | $(CPP) -P $(DTS_CPPFLAGS) - > $(DTS_TMP); \
>>> +             { { $(DTC_CMD)  2>&1 ; \
>> ...
>>
>>> +     if [ $$rc != 0 ]; then \
>>> +             echo "Source file is $(DTS_SRC)"; \
>>> +             echo "Compiler: $(DTC_CMD)"; \
>>> +     fi; \
>>
>> Isn't that what make V=1 is for?
> 
> It produces about 800KB of other spiel though. If the build fails it
> is already printing stuff out - so I find this useful.

But again, why be special? I could apply the same argument to every
single other C file where I might have typo'd something.
