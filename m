From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 0/6] General device tree irq domain infrastructure
Date: Thu, 5 May 2011 08:07:05 -0600
Message-ID: <BANLkTimQ7GsUton3nvJof8YB8k6cnx4rFQ@mail.gmail.com>
References: <20110428192227.8979.49181.stgit@ponder>
	<1304386999.2513.293.camel@pasglop>
	<20110504155227.GA3317@ponder.secretlab.ca>
	<1304555953.2513.390.camel@pasglop>
	<alpine.LFD.2.02.1105051026370.3005@ionos>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <alpine.LFD.2.02.1105051026370.3005@ionos>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Michal Simek <monstr@monstr.eu>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, x86@kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, hpa@zytor.com, Dirk Brandewie <dirk.brandewie@gmail.com>, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, May 5, 2011 at 2:37 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
> On Thu, 5 May 2011, Benjamin Herrenschmidt wrote:
>> > As for the mapping, I agree that the functionality is generally
>> > useful, I'm just not fond of the current implementation. =A0I think it
>> > is more complex than it needs to be and I'm not excited about bring it
>> > over to the other architectures as-is.
>>
>> Nobody cares about the current implementation. What is important is
>> indeed the functionality. The basic thing I think everybody agrees is
>> that you need to extend the irq_desc (or data, whatever tglx prefers)
>> with two bits of information: Some identifier of the domain and some
>> identifier of the interrupt number within that domain.
>
> irq_data because that's what is handed into the callbacks and you
> probably want to have the HW number there.

Okay, I'll take another hack at it.  Unfortunately I've got a great
big unmaskable interrupt in the form of UDS next week, but I'll be
back on it the week after.

g.
