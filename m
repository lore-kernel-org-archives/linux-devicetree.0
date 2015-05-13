From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Wed, 13 May 2015 10:09:50 +0200
Message-ID: <112A49DF-935D-41DF-8DF7-F04CC13B9598@goldelico.com>
References: <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com> <20150506092738.GB4508@amd> <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com> <554A03A7.2000504@hurleysoftware.com> <D10E1092-E75F-48F7-86F1-F8987973CEB5@goldelico.com> <20150506123632.GA1764@leverpostej> <BD3D34DD-2FC8-44A2-89FA-35843065F50F@goldelico.com> <20150506141547.GB1764@leverpostej> <EA4AC398-CAEA-40E1-A998-BC528B3788E1@goldelico.com> <20150506171802.GE2974@leverpostej> <B4D487C5-C260-497B-A441-6C381D53616C@goldelico.com> <554B7D33.602@hurleysoftware.com> <9EF54D80-F634-4D59-BFD9-FC79FCFE06DE@goldelico.com> <554B8A14.2080904@hurleysoftware.com> <21C337B3-D612-4931-BA23-6B7518E6E4DD@goldelico.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <21C337B3-D612-4931-BA23-6B7518E6E4DD@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Pavel Machek <pavel@ucw.cz>, NeilBrown <neil@brown.name>, Jiri Slaby <jslaby@suse.cz>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Marek Belisko <marek@goldelico.com>
List-Id: devicetree@vger.kernel.org

Hi Peter,

Am 07.05.2015 um 18:46 schrieb Dr. H. Nikolaus Schaller <hns@goldelico.com>:

> Hi Peter,
> 
> Am 07.05.2015 um 17:51 schrieb Peter Hurley <peter@hurleysoftware.com>:
> 
>> On 05/07/2015 11:34 AM, Dr. H. Nikolaus Schaller wrote:
>>> Am 07.05.2015 um 16:56 schrieb Peter Hurley <peter@hurleysoftware.com>:
>>>> On 05/07/2015 08:46 AM, Dr. H. Nikolaus Schaller wrote:
>> 
>>>> Both devicetree and tty/serial can already represent independent control;
>>>> what is proposed is a way to express dependent control, and in all cases,
>>>> that control stems directly from either the UART state itself or via
>>>> commands sent over that interface.
>>> 
>>> Yes. This is why I propose that the tty/uart driver can send an internal notification
>>> to the device driver. And the device driver can register to be notified by the UART
>>> that is identified by the phandle of the slave DT entry.
>> 
>> I've not seen any code with your proposal, so that makes it impossible to
>> compare competing solutions.
> 
> If you can give me some (unspecified) time to do it, I can write (simplified) patches
> to demonstrate the idea.
> 
> I just hesitate to work out and submit a counter proposal to what Neil has submitted,
> because it will become wasted effort if it is rejected before I am finished.

We have progress and some code on our workbench that identifies the uart_port by
phandle, resolves probing sequence and intercepts uart_update_mctrl calls. So we
can let the attached slave driver know that the DTR line has changed, which is
typically the power-on/off signal on UART/RS232. The driver can then power manage
the device as needed (GPIO state, GPIO pulses, regulator, I2C or whatever).

What we have not yet solved is the issue that a slave driver might want to know
that the controlled slave device is active (i.e. is autonomously sending data to the
UART). Even if the tty is not open. But we have an rough idea how we want to solve
that.

Patches will come asap.

BR,
Nikolaus
