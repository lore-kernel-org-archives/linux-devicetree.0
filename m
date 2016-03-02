From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/4] regulator: core: Add support for active-discharge
 configuration
Date: Wed, 2 Mar 2016 07:31:40 +0530
Message-ID: <56D64984.8080405@nvidia.com>
References: <1456835895-16503-1-git-send-email-ldewangan@nvidia.com> <1456835895-16503-3-git-send-email-ldewangan@nvidia.com> <20160302014421.GM18327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160302014421.GM18327@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Wednesday 02 March 2016 07:14 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Tue, Mar 01, 2016 at 06:08:13PM +0530, Laxman Dewangan wrote:
>
>> + * @active_discharge: Enable/disable active discharge. The values are:
>> + *		      -1: Default, 0: Disable, 1: Enable.
> This isn't a good interface, it means that 0 (which is the default value
> for static constrants or kzalloc()ed constraints) means to actively
> discharge rather than leave the settings unchanged but our general
> policy is to not touch anything unless explicitly told to do so.
>
Yaah, I agree.
I had other option to use 0 as default, 1 as disable and 2 as enable. 
but generally for disable, we use 0 and for enable 1 and that's why I 
went to -1,0,1 approach.

Will it be fine to have this as
   0: Default i..e do not change.
   1: disable.
   2: Enable.
