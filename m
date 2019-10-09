From: Thara Gopinath <thara.gopinath@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: thermal: Introduce monitor-falling
 parameter to thermal trip point binding
Date: Wed, 9 Oct 2019 08:54:36 -0400
Message-ID: <5D9DD88C.7090804@linaro.org>
References: <1568859503-19725-1-git-send-email-thara.gopinath@linaro.org>
 <1568859503-19725-2-git-send-email-thara.gopinath@linaro.org>
 <5d93ce86.1c69fb81.70b0d.ba56@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d93ce86.1c69fb81.70b0d.ba56@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, vincent.guittot@linaro.org, bjorn.andersson@linaro.org, amit.kucheria@verdurent.com, mark.rutland@arm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,
Thanks for the review.

On 10/01/2019 06:09 PM, Rob Herring wrote:
> On Wed, Sep 18, 2019 at 10:18:20PM -0400, Thara Gopinath wrote:
>> Introduce a new binding parameter to thermal trip point description
>> to indicate whether the temperature level specified by the trip point
>> is monitored for a rise or fall in temperature.
> 
> What if it is both?
> 
> When do you need this? Seems like you'd always want to monitor both 
> directions to undo any action done on rising temp. Unless you want a 
> hysteresis, but this doesn't seem like the best way to implement that.
> 

The thermal framework is designed in such a manner that I cannot think
of a use case for both.
The framework takes care of removing the warming/cooling action when the
trip point is crossed in the opposite direction. It only needs an
indication on when to start implementing the
action.
For eg. When the temperature crosses/increases above 90 degree, the
framework will start the cooling action and will continue monitoring
till the temperature falls below 90 and the cooling action is removed.
Vice versa when the temperature decreases below say 5 degree, the
framework should  initiate the warming action and monitor till the
temperature rises above and remove the warming action.

So the trip point is really an indication of the temperature crossing a
threshold in the specified direction.

Now this parameter is needed to indicate whether the thermal framework
has to start implementing the warming/cooling action when the
temperature  rises above the trip point or falls below the trip point.

Till now the framework was always assuming that the cooling action had
to be implemented when temperature rises above the trip point.

-- 
Warm Regards
Thara
