From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/2] regulator: userspace-consumer: add DT binding details
Date: Wed, 6 Aug 2014 13:03:52 +0530
Message-ID: <53E1DA60.9010401@nvidia.com>
References: <1406728440-17837-1-git-send-email-ldewangan@nvidia.com> <1406728440-17837-2-git-send-email-ldewangan@nvidia.com> <20140730155302.GE20162@leverpostej> <20140730164014.GY17528@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140730164014.GY17528@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 30 July 2014 10:10 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Jul 30, 2014 at 04:53:03PM +0100, Mark Rutland wrote:
>> On Wed, Jul 30, 2014 at 02:54:00PM +0100, Laxman Dewangan wrote:
>>> +Required properties:
>>> +- compatible		: Must be "reg-userspace-consumer".
>> I would never expect to see "userspace" in a DT beinding string; this is
>> entirely a software abstraction description and has nothing to do with
>> the interaction of HW components.
>> Why do you think we need this in the DT?
> Yes, this is test code - it is not intended to be used in production.
> Any binding should be for the consumer using this, not for this
> implementation detail.
>

We have the GPS module and its driver in the user space. There is no 
code for GPS on kernel. Just power on and open port from user space, get 
the information.

On this case, how do we power on GPS module if we don't expose it? It 
need two power source for digital section and analog section.
