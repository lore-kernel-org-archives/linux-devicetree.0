From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [PATCH 0/3] Qualcomm Resource Power Manager driver
Date: Thu, 29 May 2014 11:14:00 -0700
Message-ID: <CAJAp7OjYSPLiJXOfY_v=zC+S-_1ryFw29Du6mcp9nQ3v_cj5Jw@mail.gmail.com>
References: <1401211721-19712-1-git-send-email-bjorn.andersson@sonymobile.com>
	<F773CDFB-2957-49C0-99D3-E9CDCE33C378@codeaurora.org>
	<CAJAp7Ojb7PvuNYJkPyKx+iehi0bF6rdYvYmfrDz21mebxMN1qg@mail.gmail.com>
	<8CA95B37-E5EE-46BE-ABFD-64AA3BBF4E96@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8CA95B37-E5EE-46BE-ABFD-64AA3BBF4E96-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 28, 2014 at 10:06 AM, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wro=
te:
> It is the purpose so that as we see common patterns between either dr=
ivers/soc/<VENDOR> we can refactor in the future.  However, we need to =
all a little time for those patterns to emerge rather than shoe horning=
 in drivers into places that don=E2=80=99t make sense.

Sounds reasonable, I'll move it for v2.

>
>>
>> If I move the rpm driver, are there any conclusion to where I should
>> move the dt binding documentation?
>
> devicetree/bindings/soc/qcom
> include/dt-bindings/soc

Thanks.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
