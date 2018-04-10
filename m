From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 1/3] drm/vc4: Remove the need for the GPU-subsystem DT
 node.
Date: Tue, 10 Apr 2018 20:28:13 +0200 (CEST)
Message-ID: <8806871.109949.1523384893773@email.1und1.de>
References: <20180409230040.1100-1-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180409230040.1100-1-eric@anholt.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-rpi-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Jon Mason <jonmason@broadcom.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Eric,

> Eric Anholt <eric@anholt.net> hat am 10. April 2018 um 01:00 geschrieben:
> 
> 
> The GPU subsystem node was a workaround to have a central device to
> bind V3D and display to.  Following the lead of 246774d17fc0
> ("drm/etnaviv: remove the need for a gpu-subsystem DT node"), remove
> the subsystem node usage and just create a platform device for the DRM
> device to attach to if any of the subsystem devices are present.

i didn't test it. Does the code change keep the backward compatibility with older DT?
