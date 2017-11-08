From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: mfd: mc13xxx: Remove obsolete property
Date: Wed, 8 Nov 2017 16:29:36 -0200
Message-ID: <CAOMZO5ANYGhdCxtjYDOnpSZmDzVjRYcHoScbOHT1ytmvs8tOhg@mail.gmail.com>
References: <1505922711-22070-1-git-send-email-fabio.estevam@nxp.com>
 <20170927214701.sizd5wc3azou5x7c@rob-hp-laptop> <CAOMZO5DQCb-GCwxZkSqRowSsWL_1fOOs7wbGAmpikCqHj9j6Lg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5DQCb-GCwxZkSqRowSsWL_1fOOs7wbGAmpikCqHj9j6Lg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Tue, Oct 17, 2017 at 11:05 AM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Lee,
>
> On Wed, Sep 27, 2017 at 6:47 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Wed, Sep 20, 2017 at 12:51:51PM -0300, Fabio Estevam wrote:
>>> The 'fsl,spi-num-chipselects' property is obsolete according to
>>> Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt, so remove
>>> it from the example.
>>>
>>> Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/mfd/mc13xxx.txt | 1 -
>>>  1 file changed, 1 deletion(-)
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Will this one go through your tree?

Ping for this simple patch.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
