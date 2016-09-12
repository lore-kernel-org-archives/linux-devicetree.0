From: Timur Tabi <timur@tabi.org>
Subject: Re: ARM, SoC: About the use DT-defined properties by 3rd-party
 drivers
Date: Mon, 12 Sep 2016 11:49:07 -0500
Message-ID: <57D6DC83.8020000@tabi.org>
References: <57BDAF2E.10502@laposte.net>
 <CAOZdJXVjsR3NTWiJX33yT3jYk=FU65raWoMooTLD7OMN3sqP-A@mail.gmail.com>
 <57D69FB1.2020801@laposte.net> <20160912123809.GB13741@leverpostej>
 <57D6AA54.6000208@laposte.net> <20160912135549.GA14165@leverpostej>
 <CANCZdfri+T59FA4XTaH5JbW0BaJHt3w5eaSkpD8NrJn6nZrZbA@mail.gmail.com>
 <57D6D7D2.7030507@laposte.net>
 <CANCZdfqZEMRaFqgph6kZPdyxBcURBiEV0XoH0vPG28Hhm5+77A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANCZdfqZEMRaFqgph6kZPdyxBcURBiEV0XoH0vPG28Hhm5+77A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Warner Losh <imp@bsdimp.com>, Sebastian Frias <sf84@laposte.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Mason <slash.tmp@free.fr>, Linux ARM <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Warner Losh wrote:
> Do I have more examples
> where FreeBSD has to deviate because the DT is actually Linux
> specific and does a poor job of modeling the hardware and instead
> reflects the Linux driver model? I have plenty of those...

I think it would be a great idea if the FreeBSD and Linux DT maintainers 
collaborated on cleaning up the DT bindings so that this problem no 
longer occurs (or at least, not normally).

I would love to see some of those examples.
