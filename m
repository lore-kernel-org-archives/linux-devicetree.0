From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V4] regulator: palmas: add support for external control
 of rails
Date: Fri, 6 Sep 2013 11:45:34 +0530
Message-ID: <52297306.8000101@nvidia.com>
References: <1377082096-22296-1-git-send-email-ldewangan@nvidia.com> <20130823095841.GG25263@sirena.org.uk> <522897FD.2030509@nvidia.com> <20130905143431.GI8980@lee--X1> <52289BD4.9060607@nvidia.com> <20130905153432.GD3084@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130905153432.GD3084@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "rob@landley.net" <rob@landley.net>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "kishon@ti.com" <kishon@ti.com>, "j-keerthy@ti.com" <j-keerthy@ti.com>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

On Thursday 05 September 2013 09:04 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Thu, Sep 05, 2013 at 08:27:24PM +0530, Laxman Dewangan wrote:
>> On Thursday 05 September 2013 08:04 PM, Lee Jones wrote:
>>> It won't go in until v3.12 now, but I have applied the patch.
>> Thanks Lee for taking care.
> If it's going to wait for v3.12 there's no point applying it to MFD as
> the dependency will be in mainline after the merge window.
Agree that it should go on regulator tree if it is v3.12 and if there is 
any issue on applying the patch, I will resend at that time after 
rebasing to that branch.

Thanks,
Laxman

