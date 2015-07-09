From: Cory Tusar <cory.tusar@pid1solutions.com>
Subject: Re: [PATCH 0/1] Add support for esdhc0 on Vybrid.
Date: Thu, 09 Jul 2015 08:40:01 -0400
Message-ID: <559E6BA1.7030101@pid1solutions.com>
References: <1436388666-29376-1-git-send-email-cory.tusar@pid1solutions.com>
 <CAOpc7mEuDm=YS5TB6MN5PTtNy7yMiTXEetUoXdVC28ZEkf1Cvw@mail.gmail.com>
 <63570c082077002155d3a99567664ef3@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <63570c082077002155d3a99567664ef3@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Agner <stefan@agner.ch>, Holger Schurig <holgerschurig@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, open list <linux-kernel@vger.kernel.org>, robh+dt@kernel.org, andrew@lunn.ch, Sascha Hauer <kernel@pengutronix.de>, galak@codeaurora.org, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/09/2015 02:13 AM, Stefan Agner wrote:
> On 2015-07-09 08:07, Holger Schurig wrote:
>>> Cory Tusar (1):
>>>   ARM: dts: vfxxx: Include support for esdhc0 functionality.
>>>
>>>  arch/arm/boot/dts/vfxxx.dtsi | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> --
>>> 2.3.6
>>
>> Your patch looks empty.
> 
> This is a cover letter which provides overview over a whole patchset.
> The patch is a separate reply message of this mail (PATCH 1/1). 
> 
> @Cory
> However, it is unusual to use a cover letter when there is only a single
> patch. If you want to add additional comments which should not be part
> of the commit message, you can edit the patch and insert text after the
> three dashes, just before the diffstat. This text won't be part of the
> commit when applied later.

Hi Stefan,

Duly noted.  Appreciate the feedback, and will keep in mind for next
time.

Best regards,
- -Cory


- -- 
Cory Tusar
Principal
PID 1 Solutions, Inc.


"There are two ways of constructing a software design.  One way is to
 make it so simple that there are obviously no deficiencies, and the
 other way is to make it so complicated that there are no obvious
 deficiencies."  --Sir Charles Anthony Richard Hoare

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWea6EACgkQHT1tsfGwHJ8CYACgqK20a6hhtl66aA+an5lWX4Ob
jTgAoKiygJTWpw9oYrmiZWk874tzkoZa
=YMvj
-----END PGP SIGNATURE-----
