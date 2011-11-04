From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [GIT PULL] A few more device tree changes
Date: Fri, 4 Nov 2011 00:19:43 -0400
Message-ID: <CACxGe6vOqjmmoV+6pT+HM6f8hK+9UVvF10SijGSS2DKiGSwSAg@mail.gmail.com>
References: <CACxGe6t-xaH4U9F7uGOabYD-KKSHZNyQ3Ds036FhubScqR=vGQ@mail.gmail.com>
 <CACxGe6uAKBrkxQ2puiO+hhcymXTjev3LG=0kzaSeGnsEHdeX6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6uAKBrkxQ2puiO+hhcymXTjev3LG=0kzaSeGnsEHdeX6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Updated pull req, this time with feeling (and the branch actually pushed ou=
t)

g.

The following changes since commit d6748066ad0e8b2514545998f8367ebb3906f299:

  Merge branch 'upstream' of
git://git.linux-mips.org/pub/scm/ralf/upstream-linus (2011-11-03
13:28:14 -0700)

are available in the git repository at:

  git://git.secretlab.ca/git/linux-2.6 devicetree/merge

Grant Likely (1):
      Merge branch 'for-grant' of
git://sources.calxeda.com/kernel/linux into devicetree/merge

Nicolas Ferre (1):
      dt: add empty of_alias_get_id() for non-dt builds

Olof Johansson (1):
      dt/platform: minor cleanup

Rob Herring (1):
      ahci: add DT binding for Calxeda AHCI controller

Stephen Warren (1):
      dt: add empty of_machine_is_compatible

 .../devicetree/bindings/ata/calxeda-sata.txt       |   17 ++++++++++++
 drivers/ata/ahci_platform.c                        |    7 +++++
 drivers/of/platform.c                              |   28 +++++++++++-----=
---
 include/linux/of.h                                 |   10 +++++++
 4 files changed, 50 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ata/calxeda-sata.txt


On Fri, Nov 4, 2011 at 12:01 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> On Thu, Nov 3, 2011 at 11:56 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>> Hi Linus,
>>
>> A few more for 3.2. =A0Nothing exciting here.
>>
>> g.
>>
>> The following changes since commit d6748066ad0e8b2514545998f8367ebb3906f=
299:
>>
>> =A0Merge branch 'upstream' of
>> git://git.linux-mips.org/pub/scm/ralf/upstream-linus (2011-11-03
>> 13:28:14 -0700)
>>
>> are available in the git repository at:
>>
>> =A0git://git.secretlab.ca/git/linux-2.6 ..BRANCH.NOT.VERIFIED..
>
> Okay, well that was stupid. =A0I'll push out the branch and send out a
> new pull req.
>
> g.
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
