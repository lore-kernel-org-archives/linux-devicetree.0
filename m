From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/4] mailbox: add support for System Control and Power
 Interface(SCPI) protocol
Date: Tue, 28 Apr 2015 09:41:40 +0100
Message-ID: <553F47C4.7050502@arm.com>
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com>	 <1430134846-24320-2-git-send-email-sudeep.holla@arm.com> <1430206564.2411.21.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430206564.2411.21.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, "Jon Medhurst (Tixy)" <tixy@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 28/04/15 08:36, Paul Bolle wrote:
> Just one nit: a license mismatch.
>
> On Mon, 2015-04-27 at 12:40 +0100, Sudeep Holla wrote:
>> --- /dev/null
>> +++ b/drivers/mailbox/scpi_protocol.c
>
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along
>> + * with this program. If not, see <http://www.gnu.org/licenses/>.
>
> This states the license is GPL v2.
>
>> +MODULE_LICENSE("GPL");
>
> And, according to include/linux/module.h, this states the license is GPL
> v2 or later. So I think either the comment at the top of this file or
> the license ident used in the MODULE_LICENSE() macro should be changed.
>
> Likewise for 2/4 and 4/4.

Thanks for pointing this out. Will fix in the next version.

Regards,
Sudeep
