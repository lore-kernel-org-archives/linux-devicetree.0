From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC v5 1/2] [media] Add common video interfaces OF bindings
 documentation
Date: Thu, 31 Jan 2013 18:51:39 +0100
Message-ID: <510AAF2B.8060008@samsung.com>
References: <1359652738-1544-1-git-send-email-s.nawrocki@samsung.com>
 <1359652738-1544-2-git-send-email-s.nawrocki@samsung.com>
 <2299160.YVaS9PguWs@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <2299160.YVaS9PguWs@avalon>
Sender: linux-media-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: g.liakhovetski@gmx.de, linux-media@vger.kernel.org, hverkuil@xs4all.nl, kyungmin.park@samsung.com, swarren@wwwdotorg.org, rob.herring@calxeda.com, thomas.abraham@linaro.org, t.figa@samsung.com, myungjoo.ham@samsung.com, sw0312.kim@samsung.com, prabhakar.lad@ti.com, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On 01/31/2013 06:33 PM, Laurent Pinchart wrote:
>> Changes since v4:
>>  - added note that multiple endpoints at a port can be active at any time,
>>  - introduced optional 'ports' node aggregating 'port' nodes if required
>>    to avoid conflicts with any child bus of a device,
> 
> The 'ports' node seems to be missing from the documentation.

Ouch, indeed. I must have lost it somewhere during rebase :-/
I'll re-create it and resend.

--

Regards,
Sylwester
