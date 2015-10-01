From: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [Qemu-devel] QEMU fw_cfg DMA interface
Date: Thu, 1 Oct 2015 18:19:17 +0200
Message-ID: <560D5D05.3070607@redhat.com>
References: <1443701677-13629-1-git-send-email-markmb@redhat.com>
 <560D5945.5050700@redhat.com> <560D5B1B.10104@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <560D5B1B.10104@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Marc_Mar=c3=ad?= <markmb@redhat.com>, linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, seabios@seabios.org
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@linaro.org>, Drew <drjones@redhat.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Stefan Hajnoczi <stefanha@gmail.com>, Alexander Graf <agraf@suse.de>, Kevin O'Connor <kevin@koconnor.net>, Gerd Hoffmann <kraxel@redhat.com>
List-Id: devicetree@vger.kernel.org

On 10/01/15 18:11, Eric Blake wrote:
> On 10/01/2015 10:03 AM, Eric Blake wrote:
>> [meta-comment]
>>
>> On 10/01/2015 06:14 AM, Marc Mar=C3=AD wrote:
>>> Implementation of the FW CFG DMA interface.
>>
>> The subject line is missing "v4" and "0/7". Also, the cover letter i=
s
>> missing a diffstat.  That makes it harder to see from the cover lett=
er
>> what the rest of the series is about.  'git format-patch/send-email
>> --cover-letter' does what you want; you can even 'git config
>> format.coverletter=3Dauto' to always include a decent cover letter o=
n any
>> multi-patch series.
>=20
> Oh, I see - you sent a meta-cover letter (the one I replied to in thi=
s
> subthread), and then a patch series including a cover letter (the rea=
l
> 0/7, then 1/7 and friends in-reply-to the 0/7) as a child of the
> meta-cover.  It's still a bit awkward for tools that expect the 0/7 a=
s
> the start of the thread,

Yep, the pattern I just described doesn't consider those tools. Is that
a bad problem? Maybe the pattern is not so clever then. :)

(I'm allowed to say bad things about it, because I "invented" it
"independently". :))

> and part of my confusion was caused by
> out-of-order mail delivery due to the nongnu.org mail server still
> recovering from its mail delays.
>=20

Right, those delays are not helping.

Thanks
Laszlo
