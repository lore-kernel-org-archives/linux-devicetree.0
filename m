From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] of: Allow selection of OF_DYNAMIC and OF_OVERLAY if OF_UNITTEST
Date: Wed, 25 Mar 2015 15:14:27 +0100
Message-ID: <CAMuHMdUf+W_0RhkPwUdUp7-XCjwmWVN+U_cdec1jF9fFVH-xvQ@mail.gmail.com>
References: <1422029405-9353-1-git-send-email-geert+renesas@glider.be>
	<1422029405-9353-2-git-send-email-geert+renesas@glider.be>
	<20150320122502.EB491C40724@trevor.secretlab.ca>
	<CAL_Jsq+mVvSs-9jLEHyYec2RYfqpCSev3k0oUu=7PE06h+gFXQ@mail.gmail.com>
	<20150324225428.94AF4C4091C@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150324225428.94AF4C4091C@trevor.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <robherring2@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Tue, Mar 24, 2015 at 11:54 PM, Grant Likely <grant.likely@linaro.org> wrote:
> On Fri, 20 Mar 2015 08:32:12 -0500
> , Rob Herring <robherring2@gmail.com>
>  wrote:
>> On Fri, Mar 20, 2015 at 7:25 AM, Grant Likely <grant.likely@linaro.org> wrote:
>> > On Fri, 23 Jan 2015 17:10:04 +0100
>> > , Geert Uytterhoeven <geert+renesas@glider.be>
>> >  wrote:
>> >> Currently OF_DYNAMIC and OF_OVERLAY are not visible to the user, and are
>> >> selected automatically only when needed.
>> >>
>> >> Allow them to be enabled manually to improve device tree unit test
>> >> coverage.
>> >>
>> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> >
>> > I like the change. Merged, thanks.
>>
>> Making OF_OVERLAY visible is already in 4.0-rc4.
>
> Yes, I modified the patch to fit.

I had seen Rob's comment, but due to travelling I hadn't sent an updated
version yet. Thanks for taking care!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
