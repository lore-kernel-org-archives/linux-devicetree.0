From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 3/3] leds: leds-pwm: Add device tree bindings
Date: Fri, 7 Dec 2012 15:04:51 +0100
Message-ID: <50C1F783.6090501@ti.com>
References: <1352731270-27534-1-git-send-email-peter.ujfalusi@ti.com>
 <1352731270-27534-4-git-send-email-peter.ujfalusi@ti.com>
 <20121206100052.EC8293E0E22@localhost> <50C0913B.9070802@ti.com>
 <20121207133453.800C43E0B87@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121207133453.800C43E0B87@localhost>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/07/2012 02:34 PM, Grant Likely wrote:
> It really needs to look like this:
> =

> pwmleds {
> 	compatible =3D "pwm-leds";
> 	kpad {
> 		label =3D "omap4::keypad";
> 		max-brightness =3D <127>;
> 		pwms =3D <&twl_pwm 0 7812500>;
> 	};
> 	charging {
> 		label =3D "omap4:green:chrg";
> 		max-brightness =3D <255>;
> 		pwms =3D <&twl_pwmled 0 7812500>;
> 	};
> };

OK.
So What we need to do is export the of_pwm_request() from drivers/pwm/core.c
Client drivers us of_pwm_request(node, NULL); to get the pwm when booted wi=
th DT.
Works fine on my setup this way and the DTS section looks just as you have
described.
Now I need to clean them up and resubmit.

-- =

P=E9ter
