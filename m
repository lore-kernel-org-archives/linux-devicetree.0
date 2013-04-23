From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/3] gpio: grgpio: Add device driver for GRGPIO cores
Date: Tue, 23 Apr 2013 13:09:28 +0200
Message-ID: <CACRpkdYDBuXcPDzkpL2DeaWYBXJM78cUNQkw3Uga1MyGobMayw@mail.gmail.com>
References: <1363355140-28216-1-git-send-email-andreas@gaisler.com>
 <1363355140-28216-3-git-send-email-andreas@gaisler.com>
 <CACRpkdYf7U=YY92Pma8+mWGALJvQDPU=d3x7Z6rX+rWkhuBANg@mail.gmail.com>
 <516BF4D2.8060901@gaisler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <516BF4D2.8060901-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
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
To: Andreas Larson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Cc: software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 15, 2013 at 2:38 PM, Andreas Larson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org> wrote:
> On 2013-04-10 20:50, Linus Walleij wrote:

>>> +Required properties:
>>> +
>>> +- name : Should be "GAISLER_GPIO" or "01_01a"
>>
>> What is this? Don't we usually use a .compatible string for this?
>> Name? Que? Is that something legacy?
>
> Regarding using name, this is standard for SPARC. The names in the
> device tree originates from the PROM.
>
> The name field is the actually the first field checked for a match in
> of_match_node, followed by type then compatible. See
> http://lxr.free-electrons.com/source/drivers/of/base.c#L572
>
(...)
> As for the "01_01a", the LEON SPARC systems uses a plug&play to identify
> different IP cores in the system. When the PROM is unaware of the name
> of a certain core, the name field presented from the prom will be on
> this form. This is standard handling for LEON SPARC drivers.

Thanks for detailing this! There is such a big world out there sometimes.

I'm sort of wondering why we do things the way we do in the ARM DT
world sometimes. Specifically I suspect that we should be using
name or type rather than compatible for the ARM PrimeCells, which
are a sort of plug-n-play type devices, but I guess it's too late
to change that now...

Yours,
Linus Walleij
