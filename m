From: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 1/4 v2] mtd: physmap_of: Add multiple regions and
	concatenation support
Date: Tue, 14 Apr 2009 14:57:06 +0200
Message-ID: <200904141457.06664.sr@denx.de>
References: <1239093559-12043-1-git-send-email-sr@denx.de>
	<fa686aa40904112258n1cc23b48t80b135b7016e9760@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40904112258n1cc23b48t80b135b7016e9760-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 12 April 2009, Grant Likely wrote:
> > + =A0 =A0 =A0 info =3D kzalloc(sizeof(struct of_flash) +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sizeof(struct of_flash_lis=
t) * count, GFP_KERNEL);
> > + =A0 =A0 =A0 if (!info)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_out;
> > +
> > + =A0 =A0 =A0 mtd_list =3D kzalloc(sizeof(struct mtd_info) * count, GFP=
_KERNEL);
>
> Typically I prefer to see a single kzalloc in a driver which allocates
> all the space needed in one go because it simplifies the error/unwind
> path.

In general ack, but it doesn't make much sense in this case. The 2nd malloc=
 is =

for an temporary buffer needed for mtd_concat_create() call (list of struct =

mtd_info. I can't really combine those two areas. So I'll leave this =

untouched.

Best regards,
Stefan
