From: Tanmay Inamdar <tinamdar@apm.com>
Subject: Re: [PATCH 3/5] powerpc: dts: klondike: Add UART nodes
Date: Wed, 4 Apr 2012 11:09:30 +0530
Message-ID: <CACoXjckmC-3p1Wx-fEQo0MmgH4rKGT4gRKjJ6BdvrjVy6dRrKw@mail.gmail.com>
References: <1333348747-12713-1-git-send-email-tinamdar@apm.com>
 <1333348747-12713-2-git-send-email-tinamdar@apm.com>
 <1333348747-12713-3-git-send-email-tinamdar@apm.com>
 <20120403155703.3B0593E053F@localhost>
 <CA+5PVA4_PJ2T7LGM_N_WemQKY2u6bLg0QFk4wPpd=FGESx7eiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <CA+5PVA4_PJ2T7LGM_N_WemQKY2u6bLg0QFk4wPpd=FGESx7eiQ@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Josh Boyer <jwboyer@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 4, 2012 at 6:19 AM, Josh Boyer <jwboyer@gmail.com> wrote:
> On Tue, Apr 3, 2012 at 11:57 AM, Grant Likely <grant.likely@secretlab.ca>=
 wrote:
>> On Mon, =A02 Apr 2012 12:09:05 +0530, Tanmay Inamdar <tinamdar@apm.com> =
wrote:
>>> Adding UART nodes in Klondike device tree file.
>>>
>>> Signed-off-by: Tanmay Inamdar <tinamdar@apm.com>
>>> ---
>>> :100644 100644 4ff2852... d5bf2e1... M =A0 =A0 =A0 =A0arch/powerpc/boot=
/dts/klondike.dts
>>> =A0arch/powerpc/boot/dts/klondike.dts | =A0 24 ++++++++++++++++++++++++
>>> =A01 files changed, 24 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/arch/powerpc/boot/dts/klondike.dts b/arch/powerpc/boot/dts=
/klondike.dts
>>> index 4ff2852..d5bf2e1 100644
>>> --- a/arch/powerpc/boot/dts/klondike.dts
>>> +++ b/arch/powerpc/boot/dts/klondike.dts
>>> @@ -222,6 +222,30 @@
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells=
 =3D <1>;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequ=
ency =3D <0>;
>>> +
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 UART0: serial=
@50001000 {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0device_type =3D "serial";
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0compatible =3D "ns16550";
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0reg =3D <0x50001000 0x00000100>;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0virtual-reg =3D <0x50001000>;
>>
>> Why do you need virtual-reg? =A0The kernel should handle all iomapping
>> properly without this.
>
> Right. =A0It's been used for platforms that actually use the
> zImage/treeImage wrapper for printf support, but this uses u-boot as
> far as I know. =A0It shouldn't need it.
>

Agreed. 'virtual-reg' is not required here. I will remove it in next
version of patch.

> josh
CONFIDENTIALITY NOTICE: This e-mail message, including any attachments, =

is for the sole use of the intended recipient(s) and contains information=
=A0
that is confidential and proprietary to AppliedMicro Corporation or its sub=
sidiaries. =

It is to be used solely for the purpose of furthering the parties' business=
 relationship. =

All unauthorized review, use, disclosure or distribution is prohibited. =

If you are not the intended recipient, please contact the sender by reply e=
-mail =

and destroy all copies of the original message.
