From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v4 1/5] ARM: dts: pxa: add pwri2c to pxa device-tree
Date: Mon, 23 Feb 2015 20:39:06 +0100
Message-ID: <87pp905sf9.fsf@free.fr>
References: <1423761758-29159-1-git-send-email-robert.jarzmik@free.fr>
	<87y4o04k21.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87y4o04k21.fsf@free.fr> (Robert Jarzmik's message of "Sat, 14
	Feb 2015 15:57:58 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Robert Jarzmik <robert.jarzmik@free.fr> writes:

> Robert Jarzmik <robert.jarzmik@free.fr> writes:
>
>> pxa27x variant has 2 I2C busses on the SoC :
>>  - the casual I2C
>>  - the power I2C, normally driving power regulators, and capable of
>>  receiving orders on core frequency modifications
>>
>> Add the missing pwri2c to pxa27x description.
>>
>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>
> Hi Rob, Mark, Sergei,
>
> I'd like to queue that into the pxa/dt tree next week.
> Could I have a "Reviewed-by" ?
Queued in pxa/dt.

Cheers.

-- 
Robert
