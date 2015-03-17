From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'" breaks console on tty0
Date: Tue, 17 Mar 2015 20:35:39 +0100
Message-ID: <87zj7bquwk.fsf@igel.home>
References: <55070544.9010908@redhat.com>
	<550717A0.3060603@hurleysoftware.com> <87r3sowk51.fsf@igel.home>
	<5507758B.2060000@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <5507758B.2060000@hurleysoftware.com> (Peter Hurley's message of
	"Mon, 16 Mar 2015 20:30:03 -0400")
Sender: stable-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Grant Likely <grant.likely@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Peter Hurley <peter@hurleysoftware.com> writes:

> It doesn't boot?

It boots right into user space, but the initrd doesn't like something
(perhaps the missing console) and exits.  Note that the framebuffer
console does work, but all I see are the penguins.

[    6.235604] Warning: unable to open an initial console.
[    6.237611] Freeing unused kernel memory: 2156K (c000000000a0a000 - c000000000c25000)
[    6.262059] mount (70) used greatest stack depth: 10064 bytes left
[    6.298795] mkdir (76) used greatest stack depth: 9760 bytes left
[    6.376450] sysrq: SysRq : Changing Loglevel
[    6.376513] sysrq: Loglevel set to 1
[    6.430512] systemd-udevd[111]: starting version 208
[    6.488367] udevadm (112) used greatest stack depth: 9312 bytes left
[    6.605581] ata_id (127) used greatest stack depth: 8400 bytes left
[    8.578710] btrfs (217) used greatest stack depth: 8032 bytes left
[    8.700698] PM: Starting manual resume from disk
[   13.354795] EXT4-fs (dm-1): mounting ext3 file system using the ext4 subsystem
[   13.391899] EXT4-fs (dm-1): mounted filesystem with ordered data mode. Opts: (null)
[   23.852033] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000100
[   23.852033] 
[   23.852067] CPU: 1 PID: 1 Comm: run-init Not tainted 4.0.0-rc4-test #27
[   23.852078] Call Trace:
[   23.852095] [c0000001ee0bbb30] [c0000000006f8f64] .dump_stack+0x88/0xa8 (unreliable)
[   23.852118] [c0000001ee0bbbb0] [c0000000006f52f8] .panic+0xe8/0x284
[   23.852139] [c0000001ee0bbc50] [c000000000045b38] .do_exit+0x550/0xa08
[   23.852156] [c0000001ee0bbd30] [c000000000047178] .do_group_exit+0x48/0xbc
[   23.852173] [c0000001ee0bbdc0] [c000000000047200] .__wake_up_parent+0x0/0x38
[   23.852192] [c0000001ee0bbe30] [c000000000007d18] system_call+0x38/0xd0

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
