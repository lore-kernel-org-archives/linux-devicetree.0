From: "Imre Kaloz" <kaloz@openwrt.org>
Subject: Re: [PATCH] mvebu: add Linksys WRT1900AC (Mamba) support
Date: Fri, 09 Jan 2015 13:51:09 +0100
Message-ID: <op.xr64njf92s3iss@ecaz>
References: <1420806710-27619-1-git-send-email-kaloz@openwrt.org>
 <54AFCDA3.1030601@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <54AFCDA3.1030601@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: thomas.petazzoni@free-electrons.com, devicetree@vger.kernel.org, jason@lakedaemon.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 09 Jan 2015 13:46:27 +0100, Gregory CLEMENT <gregory.clement@free-electrons.com> wrote:

Hi Gregory,

<snip>

>> + * This file is licensed under the terms of the GNU General Public
>> + * License version 2.  This program is licensed "as is" without any
>> + * warranty of any kind, whether express or implied.
>
> We are moving to a dual license GPL/X11:
> http://thread.gmane.org/gmane.linux.ports.arm.kernel/380065
>
> Could you consider to use it too?
> The file you based on will be converted, all the author of this
> file already have given their acked-by.

I'm aware of that, but Linus' tree still has the old license text so I didn't change it here. If it would be up to me, it would be simply ISC.

> In meantime, I will review the content of your patch.

Thank you. I'll incorporate whatever needs to be fixed with the license change in v2.


Imre
