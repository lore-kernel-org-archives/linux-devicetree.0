From: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: mtd: fsl-quadspi: Pass the qspi clock names
Date: Tue, 5 Dec 2017 21:11:02 +0100
Message-ID: <dfff2b1c-d0de-c21a-9a4c-e83ac68a106e@wedev4u.fr>
References: <1512340584-26894-1-git-send-email-festevam@gmail.com>
 <20171204223624.gd3iiha3qyr7nwxg@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171204223624.gd3iiha3qyr7nwxg@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 04/12/2017 à 23:36, Rob Herring a écrit :
> On Sun, Dec 03, 2017 at 08:36:24PM -0200, Fabio Estevam wrote:
>> From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
>>
>> In order to improve the bindings documentation, explicitly pass the name
>> of the clocks: "qspi_en" and "qspi", which are mandatory.
>>
>> Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
Applied to the spi-nor/next branch of l2-mtd

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
