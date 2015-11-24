From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH 3/3] drm: panel-simple: implement URT UMSH-8596MD-xT panel
 support
Date: Tue, 24 Nov 2015 22:04:47 +0100
Message-ID: <5654D0EF.3020800@maciej.szmigiero.name>
References: <5615885C.5050505@maciej.szmigiero.name> <20151008082444.GC3820@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151008082444.GC3820@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 08.10.2015 10:24, Thierry Reding wrote:
> On Wed, Oct 07, 2015 at 11:02:20PM +0200, Maciej S. Szmigiero wrote:
>> This patch implements support for United Radiant Technology
>> UMSH-8596MD-xT 7.0" WVGA TFT LCD panels in DRM panel-simple
>> driver.
>>
>> Signed-off-by: Maciej Szmigiero <mail@maciej.szmigiero.name>
>> ---
>> This replaces "drm: panel-simple: add URT UMSH-8596MD-xT panel support"
>> submission.
>>
>>  drivers/gpu/drm/panel/panel-simple.c | 54 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 54 insertions(+)
> 
> Looks good to me. I'll wait for Rob or anyone else to ack the vendor
> prefix before merging this.
> 
> Thierry

Is anybody there who can ack this prefix?

Maciej Szmigiero
