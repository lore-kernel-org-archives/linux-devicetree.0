From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFCv2 00/14]
Date: Thu, 26 Jan 2012 06:38:33 -0700
Message-ID: <CACxGe6t9VO14uY4amSd=s=htQpRn7H40rmB3k6jnmptW9ffxtQ@mail.gmail.com>
References: <1327352870-14687-1-git-send-email-grant.likely@secretlab.ca> <1327532011.24169.6.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1327532011.24169.6.camel@deneb.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Salter <msalter@redhat.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, Milton Miller <miltonm@bga.com>, benh@kernel.crashing.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 25, 2012 at 3:53 PM, Mark Salter <msalter@redhat.com> wrote=
:
> On Mon, 2012-01-23 at 14:07 -0700, Grant Likely wrote:
>> Hey everyone,
>>
>> Here's the second RFC for the irq_domain patches. =A0I could use som=
e
>> help testing now. =A0I still expect there will be a few bugs. =A0The
>> series is based on v3.3-rc1, and I've pushed it out to my git server=
:
>
> Hi Grant,
>
> I converted arch/c6x over to the generic irq_domain support and have =
not
> had any problems in testing. The c6x virtual irq support was a nearly
> identical copy of the powerpc code, so the patch I ended up with most=
ly
> copied what you did in arch/powerpc. The c6x patch is on the tip of:
>
> =A0git@linux-c6x.org:/git/projects/linux-c6x-upstreaming irq-testing
>
> I think this probably belongs in your series, but I can push it
> separately if not.

Yes, it should be in my series.  Please post the patches and cc me so
there is record of them in the mailing list archives and I'll pick
them up.

g.
