From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 6/8] of: add clock providers
Date: Wed, 30 Nov 2011 12:38:19 -0700
Message-ID: <CACxGe6teGPmgOiwSVQ_PebXo=9x8EVwjH2qQYi5LU813BvY3Ow@mail.gmail.com>
References: <1320801583-12774-1-git-send-email-grant.likely@secretlab.ca>
 <1320801583-12774-7-git-send-email-grant.likely@secretlab.ca>
 <20111121153716.GA16417@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111121153716.GA16417-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 21, 2011 at 8:37 AM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> On Tue, Nov 08, 2011 at 06:19:41PM -0700, Grant Likely wrote:
>> +struct clk *of_clk_get_by_name(struct device_node *np, const char *name)
>> +{
>> + =A0 =A0 int index =3D 0;
>> +
>> + =A0 =A0 if (name)
>> + =A0 =A0 =A0 =A0 =A0 =A0 index =3D of_property_match_string(np, "clock-=
input-names", name);
>
> If it fails to match name, we may want to force 'index' back to 0.

Actually, if it fails to match, the function should fail.  Fixed.
Fixed all the editorial comments too.  Thanks.

>
> Also according to binding document above,
> s/clock-input-names/clock-input-name? =A0Hope you do not want to
> change binding document to get them aligned. =A0I have written code
> per binding document :)

I've changed to match the binding documentation.

Thanks for the review,
g.
