From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC] pinctrl: generic: Add DT bindings
Date: Wed, 19 Jun 2013 15:52:54 -0600
Message-ID: <51C22836.9090909@wwwdotorg.org>
References: <1370988237-30593-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <2555796.PtkImJGaK8@avalon>
 <CACRpkdaF7V3FGhNNj+N+Dc-NWhsfQ=bqh+ETx0wGBFbLmxfGTw@mail.gmail.com>
 <201306152216.14252.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201306152216.14252.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
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
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/15/2013 02:16 PM, Heiko St=FCbner wrote:
> Am Samstag, 15. Juni 2013, 21:56:05 schrieb Linus Walleij:
>> On Fri, Jun 14, 2013 at 12:39 AM, Laurent Pinchart
>>
>> <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
>>>         mmcif_pins: mmcif {
>>>         =

>>>                 mux {
>>>                 =

>>>                         renesas,groups =3D "mmc0_data8_0", "mmc0_ctrl_0=
";
>>>                         renesas,function =3D "mmc0";
>>>                 =

>>>                 };
>>>                 cfg {
>>>                 =

>>>                         renesas,groups =3D "mmc0_data8_0";
>>>                         renesas,pins =3D "PORT279";
>>>                         bias-pull-up =3D <1>;
>>
>> If I understood your code correctly that last statement can *optionally*
>> be written like just:
>>
>>  bias-pull-up;
>>
>> Without the parameter?
>>
>> I think that Heiko's implementation does this anyway.
> =

> Yep, with the fixes-series from yesterday the bias-pull-* now have a bett=
er =

> default value of <1>.
> =

> so you can do
> 	bias-pull-up;
> which is then identical to the
> 	bias-pull-up =3D <1>;
> above (both are valid of course).

A property with a value is an integer. One without is a Boolean. The
same property shouldn't be both.

Regarding the value representing resistance: That feels pretty odd.
Enabling a pullup and selecting the pullup resistance feel like
orthogonal options which shouldn't be bound to each-other.
