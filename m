From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version
 3.
Date: Wed, 06 May 2015 07:10:37 -0400
Message-ID: <5549F6AD.5010208@hurleysoftware.com>
References: <20150318055437.21025.13990.stgit@notabene.brown> <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>
Cc: NeilBrown <neil@brown.name>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Nikolaus,

On 05/06/2015 01:19 AM, Dr. H. Nikolaus Schaller wrote:
> Am 05.05.2015 um 21:54 schrieb Peter Hurley <peter@hurleysoftware.com>:
> 
>> Hi Neil,
>>
>> On 03/18/2015 01:58 AM, NeilBrown wrote:
>>> here is version 3 of support for tty-slaves.
>>
>> Is there a v4 of this that I missed?
> 
> We did have a lengthy discussion about [PATCH 3/3] how to best (1)
> represent the slave device in the device tree but as far as I am concerned,
> I do not see that we have a consensus (2) and the device tree maintainers
> have no comments or clear guidelines so far.

I understand there are some design considerations still apparently
unresolved wrt devicetree representation.

However, there were significant lifetime issues in v3 and I'd like some
time to review v4 to understand how those were resolved, and study the
implications.

Maintainers are busy people and often don't provide design steering
until the other pieces are ack'd.

I'd like to see _a_ solution eventually, so let's move this process along.

Regards,
Peter Hurley
