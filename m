From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] nvmem: imx-ocotp: add write support
Date: Mon, 27 Mar 2017 15:59:17 +0200
Message-ID: <8a1caa0b-8117-4e2f-1782-a9251f617969@skidata.com>
References: <1490621491-28247-1-git-send-email-richard.leitner@skidata.com>
 <1490621491-28247-2-git-send-email-richard.leitner@skidata.com>
 <CAOMZO5DV+80np5qsq9JdKwmKFL1AkeqJ09S3o0XjQzAqYw0rYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5DV+80np5qsq9JdKwmKFL1AkeqJ09S3o0XjQzAqYw0rYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/27/2017 03:42 PM, Fabio Estevam wrote:
> [Adding Pengutronix folks and Shawn on Cc]
> 
> On Mon, Mar 27, 2017 at 10:31 AM, Richard Leitner
> <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org> wrote:
>> Implement write routine for OCOTP controller found in i.MX6 SoC's.
>> Furthermore add locking to the read function to prevent race conditions.
>> The write routine code is based on the fsl_otp driver from Freescale.
>>
>> Signed-off-by: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
> 
> Do we really want to have write support in the driver?

We need it for our "factory startup" process and other fusebox drivers
support it as well. Therefore I thought it would be a good idea to bring
it upstream.

Furthermore you can disable it via devicetree (and it would also be
possible to introduce a CONFIG for write support if it's wanted).

kind regards,
Richard L
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
