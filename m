From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] regulator: Add LTC3676 support
Date: Wed, 10 Aug 2016 17:46:44 -0700
Message-ID: <CAJ+vNU2UjYUzMS+yipc-gZM0a2=9inrmTX_qnMQ5JD9c4xpzvw@mail.gmail.com>
References: <1470785767-4426-1-git-send-email-tharvey@gateworks.com> <20160810222825.GA2650@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160810222825.GA2650@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jaffer Kapasi <jkapasi-td5IlybW20HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 10, 2016 at 3:28 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Aug 09, 2016 at 04:36:07PM -0700, Tim Harvey wrote:
>> This patch adds support for the Linear Technology LTC3676
>> 8-output I2C voltage regulator IC.
>>
>> Cc: Jaffer Kapasi <jkapasi-td5IlybW20HQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
>> ---
>>  .../devicetree/bindings/regulator/ltc3676.txt      |  94 ++++
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>

Rob,

Should I have submitted this as a two patch series so that I could add
your 'Acked-by' for that patch or is there a standard way for me to
add your 'Acked-by' to future versions of the patch 'just' for that
particular file?

Regards,

Tim
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
