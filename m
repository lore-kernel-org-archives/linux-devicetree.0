From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/5] pinctrl: qcom: Add ipq8074 pinctrl driver
Date: Tue, 23 May 2017 11:26:24 +0200
Message-ID: <CACRpkdaiXq9ivmPOcAS4UVM-7Fz1aPYuqPw5bOHjOn2PJvSKzw@mail.gmail.com>
References: <1493898841-20583-1-git-send-email-varada@codeaurora.org>
 <1493898841-20583-2-git-send-email-varada@codeaurora.org> <20170510224355.GE45273@Bjorns-MacBook-Pro-2.local>
 <1f4c9974-f6a4-bee7-4f37-ad8795e442a3@codeaurora.org> <20170514042307.GE69278@Bjorns-MacBook-Pro-2.local>
 <7afc7191-bcb1-a566-eac5-a4fe1293c773@codeaurora.org> <20170517193315.GF12920@tuxbook>
 <f5a3da8b-c3a4-3cb3-9f5f-0cbdb87688ed@codeaurora.org> <20170520055430.GU12920@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170520055430.GU12920@tuxbook>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Manoharan Vijaya Raghavan <mraghava-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sjaganat-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 20, 2017 at 7:54 AM, Bjorn Andersson
<bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu 18 May 01:39 PDT 2017, Varadarajan Narayanan wrote:

>> There are 18 pins. 15 pins are common between LCD and NAND. The QPIC
>> controller arbitrates between LCD and NAND. Of the remaining 4, 2 are for
>> NAND and 2 are for LCD exclusively. We plan to group the qpic pins into 3
>> groups namely, qpic_common, qpic_nand and qpic_lcd. Is that ok?
>>
>
> If you consider that you are defining the available functions for this
> pinmuxer and then define the sets of pins exposing these available
> functions it does make sense to just name it "qpic".
>
> I think that naming them _common, _lcd and _nand is just adding
> confusion when it comes to writing the dts files.
>
> @Linus, do you have a different preference here?

No I pretty much trust the driver maintainer to know this best.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
