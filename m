From: Daniel Drake <dsd@laptop.org>
Subject: OF IOAPIC bindings compile error
Date: Fri, 25 Feb 2011 15:35:08 +0000
Message-ID: <AANLkTin-2FH-c_5DVpW29zvARW827Ebun31=z2b+jB00@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Andres Salomon <dilinger@queued.net>, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

Hi,

Testing linux-2.6-x86.git, I encountered a compile error which seems
to caused by the following commit with X86_IO_APIC=3Dn:

commit bcc7c1244fcfd852b9f4590935491057e1cab9dd
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date:   Tue Feb 22 21:07:44 2011 +0100

    x86: ioapic: Add OF bindings for IO_APIC

Error is:
arch/x86/kernel/devicetree.c: In function =91x86_dtb_find_config=92:
arch/x86/kernel/devicetree.c:288:3: error: lvalue required as left
operand of assignment

It can be fixed by inserting #ifdef CONFIG_X86_IO_APIC inside
x86_dtb_find_config, but I'm not sure if this is the correct approach.

=2Econfig file in question:
http://dev.laptop.org/~dsd/20110225/ioioapic-problem-config.txt

Daniel
