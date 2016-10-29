From: Joel Holdsworth <joel-IJEoVVyKhCJXvIrf17iDB/XRex20P6io@public.gmane.org>
Subject: Re: [v2 2/2] fpga: Add support for Lattice iCE40 FPGAs
Date: Sat, 29 Oct 2016 15:38:08 -0600
Message-ID: <2779d292-779d-b57a-1b0a-ed67644f6c2e@airwebreathe.org.uk>
References: <1477283989-21947-1-git-send-email-joel@airwebreathe.org.uk>
 <1477283989-21947-2-git-send-email-joel@airwebreathe.org.uk>
 <alpine.DEB.2.02.1610241615280.14525@linuxheads99>
 <20161024222805.GA5754@live.com>
 <331cd8da-f69a-b51a-ddbd-f18ee44cac8a@airwebreathe.org.uk>
 <CAAtXAHfcfveozw_3kpXz9pA0ZSTeuo9CNs9vRq1Y+BhrNuim7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAtXAHfcfveozw_3kpXz9pA0ZSTeuo9CNs9vRq1Y+BhrNuim7A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Cc: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I just submitted a version of the driver without copy-pasted chip-select 
code. The PATCH v4 version uses a pair of zero-byte SPI transfers to 
control the CS line.

I didn't get a response from the linux-spi mailing list, but in my 
opinion they're probably not going to want spi_set_cs to become a 
public-internal API, and zero-byte transfers have the desired effect.

Thanks
Joel


On 10/25/2016 10:48 AM, Moritz Fischer wrote:
> Hi Joel,
>
> On Mon, Oct 24, 2016 at 9:51 PM, Joel Holdsworth
> <joel-IJEoVVyKhCJXvIrf17iDB/XRex20P6io@public.gmane.org> wrote:
>
>> I think my set_cs() function is ok-ish. It's copied from spi_set_cs() in
>> drivers/spi/spi.c . This function is a static internal helper, so I
>> copy/pasted the function into the ice40 driver. Given that it's only 4-lines
>> of code, it didn't seem too bad - though I'm not exactly sure why
>> spi_set_cs() isn't a public API. It seems like quite a common-place thing to
>> need to do with certain devices.
>>
>> However, perhaps the function is internal because the authors of the SPI
>> framework foresaw how easy it would be to screw up a shared bus with that
>> function. I had to take care to make sure the SPI bus was locked throughout.
>>
>> Do you agree that it's the right thing to copy the function in? Or do you
>> think it would be better to ask for spi_set_cs to be exposed publicly?
>
> I'd poke the SPI maintainers about what their reasoning was to make it
> non-public,
> and how they'd go about doing what you're trying to do.
> I can imagine there might be some SPI controllers where the above
> doesn't work well,
> because the controller automatically handles the CS line and you don't
> get control over it.
>
> Cheers,
>
> Moritz
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
