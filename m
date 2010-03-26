From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] [v2] powerpc/fsl: add device tree binding for QE firmware
Date: Fri, 26 Mar 2010 13:53:55 -0600
Message-ID: <fa686aa41003261253g611eaa6foa06abd79af9a5a10@mail.gmail.com>
References: <1269632145-28462-1-git-send-email-timur@freescale.com>
	<fa686aa41003261245h52e151ceoa4f85e38055ae6a7@mail.gmail.com>
	<4BAD1004.5050507@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4BAD1004.5050507-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 26, 2010 at 1:50 PM, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Grant Likely wrote:
>> The node must be a child of a QE node. =A0A QE node can reference the
>> firmware from another QE node by using the fsl,firmware-phandle
>> property.
>
> Ok.
>
> I'll post a V3 once everyone else has a chance to comment.

Also, since it is a documentation only change, I'll pick it up into
the branch that I'm about to ask Linus to merge in the next day or so.

g.
