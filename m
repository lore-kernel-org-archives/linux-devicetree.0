From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 0/2 RESEND] power: reset: Add syscon reboot/poweroff
 device nodes for APM X-Gene platform
Date: Tue, 14 Jul 2015 10:40:04 +0200
Message-ID: <20150714084004.GA14593@localhost>
References: <1433272747-27114-1-git-send-email-ttnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1433272747-27114-1-git-send-email-ttnguyen@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tai Nguyen <ttnguyen@apm.com>
Cc: devicetree@vger.kernel.org, jcm@redhat.com, patches@apm.com, linux-kernel@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 02, 2015 at 12:19:05PM -0700, Tai Nguyen wrote:
> This patch set adds syscon reboot/poweroff device nodes to support reboot and
> poweroff features on X-Gene platform. 
> 
> Tai Nguyen (2):
>   power: reset: Add syscon reboot device node for APM X-Gene platform
>   power: reset: Add syscon poweroff device node for APM X-Gene Mustang platform
> 
>  arch/arm64/boot/dts/apm/apm-mustang.dts |   12 ++++++++++++
>  arch/arm64/boot/dts/apm/apm-storm.dtsi  |   12 ++++++++++++
>  2 files changed, 24 insertions(+)

Hi,

It's unclear to me what you want to happen to these patches. They are
sent to a long list of to-recipients, one of which is arm@kernel.org. In
general, specify the person you want to take action on the patch in to
with the rest on cc.

We generally ask that patches first go to the subarch maintainers,
and they in turn send it on to us (either through a pull request or
by sending the patches to be applied). In the case of X-Gene, there is
no general platform maintainer so we keep getting patches from various
engineers at APM and it's unclear to us what your intentions are.

I'd prefer to see one (to start with) person in charge of these (i.e. one
maintainer from the APM side). Please add that person to the MAINTAINERS
file as well.


Thanks!

-Olof
