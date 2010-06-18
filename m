From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 5/5] of/irq: merge of_irq_map_one()
Date: Thu, 17 Jun 2010 18:39:47 -0600
Message-ID: <AANLkTikgNZakdVmIF4QcRQJWXUaczIWbJPmx2-W--QSc@mail.gmail.com>
References: <20100604212134.10552.70717.stgit@angua>
	<20100604212155.10552.19260.stgit@angua>
	<1276152002.1962.55.camel@pasglop>
	<AANLkTinmDFBvAjcjrgf3RHuiXgNxVV20yLzBaqhE5lrk@mail.gmail.com>
	<1276219072.1962.82.camel@pasglop>
	<AANLkTin5K0IL5iKj9i9qBucSpQz2-p5wIvUtC4iU0jUP@mail.gmail.com>
	<1276819045.8826.45.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1276819045.8826.45.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 17, 2010 at 5:57 PM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Thu, 2010-06-17 at 17:11 -0600, Grant Likely wrote:
>> On Thu, Jun 10, 2010 at 7:17 PM, Benjamin Herrenschmidt
>> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>> > On Thu, 2010-06-10 at 17:36 -0600, Grant Likely wrote:
>> >>
>> >> Okay. =A0I had been trying to avoid #ifdefs in the common code, but
>> >> you're probably right. =A0I'll rework.
>> >
>> > Not even ifdef's ... just move the quirk map there. You can always
>> > #define the quirk variable to 0 on archs that have no quirks, to
>> > make it compile away if you believe it represents bloat, but they
>> > are simple well localized things so I doubt it matters.
>>
>> They're pretty small, but powermac32 is the only code that actually
>> uses the quirk facility. =A0Everything else parses sanely it would
>> appear. =A0I'd rather have them localized to the powermac code and
>> eliminate the quirks from the common code.
>
> Maybe, but the way you end up gutting out some internal functions of the
> parser so they can be overriden by the arch is just plain gross :-)

Heh, I won't dispute that.  Give me a day or so.  If I can't come up
with anything better, then I'll just move it all over.

g.
