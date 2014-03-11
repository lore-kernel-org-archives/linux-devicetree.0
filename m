From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v7 3/10] Documentation: devicetree: Update Samsung FIMC DT
 binding
Date: Tue, 11 Mar 2014 17:30:56 +0100
Message-ID: <531F3A40.1030704@samsung.com>
References: <24917002.Y0kBkkQHhZ@avalon>
 <1394553635-12134-1-git-send-email-s.nawrocki@samsung.com>
 <1823087.0J3KNi6X3C@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1823087.0J3KNi6X3C@avalon>
Sender: linux-media-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, galak@codeaurora.org, kyungmin.park@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On 11/03/14 17:20, Laurent Pinchart wrote:
>>  Image sensor nodes
>> >  ------------------
>> > @@ -97,8 +108,8 @@ Image sensor nodes
>> >  The sensor device nodes should be added to their control bus controller
>> > (e.g. I2C0) nodes and linked to a port node in the csis or the
>> > parallel-ports node, using the common video interfaces bindings, defined in
>> > video-interfaces.txt.
>> > -The implementation of this bindings requires clock-frequency property to be
>> > -present in the sensor device nodes.
>> > +An optional clock-frequency property needs to be present in the sensor
>> > device
>> > +nodes. Default value when this property is not present is 24 MHz.
>
> I think you forgot to drop that sentence.

Indeed, sorry, I'll fix that and repost.

--
Thanks,
Sylwester
