From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] kbuild: avoid unrecognized option error for external DTC
Date: Tue, 28 Feb 2017 21:21:02 +1100
Message-ID: <87tw7epqep.fsf@concordia.ellerman.id.au>
References: <1488174052-2530-1-git-send-email-yamada.masahiro@socionext.com>
 <1488204416.2819.9.camel@decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1488204416.2819.9.camel@decadent.org.uk>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Ben Hutchings <ben@decadent.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Aurelien Jacquiot <a-jacquiot@ti.com>, Paul Mackerras <paulus@samba.org>, Jonas Bonn <jonas@southpole.se>, linux-c6x-dev@linux-c6x.org, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Emese Revfy <re.emese@gmail.com>, Mark Salter <msalter@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Scott Wood <oss@buserror.net>, Rob Herring <robh+dt@kernel.org>, Stafford Horne <shorne@gmail.com>, Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, openrisc@lists.librecores.org
List-Id: devicetree@vger.kernel.org

Ben Hutchings <ben@decadent.org.uk> writes:

> [ Unknown signature status ]
> On Mon, 2017-02-27 at 14:40 +0900, Masahiro Yamada wrote:
>> Since commit 6b22b3d1614a ("kbuild: Allow using host dtc instead of
>> kernel's copy"), it is possible to use an external dtc.=C2=A0=C2=A0In th=
is
>> case, we do not know which options are supported on it.
>>=20
>> Commit bc553986a2f7 ("dtc: turn off dtc unit address warnings by
>> default") gives -Wno-unit_address_vs_reg, but this options is only
>> recognized by v1.4.2 or later.
>>=20
>> If an older version is specified, the build fails:
>
> But the option to use an external dtc was intended to allow testing of
> newer versions.  If there's no reason to use this option to run an
> older version, why bother trying to support that?

+1

That's a lot of added complexity, when the answer could just be "use the
kernel dtc".

cheers
