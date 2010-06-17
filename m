From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 5/5] of/irq: merge of_irq_map_one()
Date: Thu, 17 Jun 2010 17:11:02 -0600
Message-ID: <AANLkTin5K0IL5iKj9i9qBucSpQz2-p5wIvUtC4iU0jUP@mail.gmail.com>
References: <20100604212134.10552.70717.stgit@angua>
	<20100604212155.10552.19260.stgit@angua>
	<1276152002.1962.55.camel@pasglop>
	<AANLkTinmDFBvAjcjrgf3RHuiXgNxVV20yLzBaqhE5lrk@mail.gmail.com>
	<1276219072.1962.82.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1276219072.1962.82.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Simek <monstr@monstr.eu>, microblaze-uclinux@itee.uq.edu.au, devicetree-discuss@lists.ozlabs.org, linuxppc-dev@ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 10, 2010 at 7:17 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Thu, 2010-06-10 at 17:36 -0600, Grant Likely wrote:
>>
>> Okay. =A0I had been trying to avoid #ifdefs in the common code, but
>> you're probably right. =A0I'll rework.
>
> Not even ifdef's ... just move the quirk map there. You can always
> #define the quirk variable to 0 on archs that have no quirks, to
> make it compile away if you believe it represents bloat, but they
> are simple well localized things so I doubt it matters.

They're pretty small, but powermac32 is the only code that actually
uses the quirk facility.  Everything else parses sanely it would
appear.  I'd rather have them localized to the powermac code and
eliminate the quirks from the common code.

If other platforms show up with bad irq mappings, then I want to take
the approach of fixing the data rather than adding more quirks cases.

Anyway, let me try my hand at reworking to be a lot clearer and see
what it looks like.

g.
