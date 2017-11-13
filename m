From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH] ARM: dts: keystone-k2l: Add the second gpio bank node
Date: Mon, 13 Nov 2017 09:12:53 -0800
Message-ID: <61c80992-92bd-a401-457c-267c64a3400d@oracle.com>
References: <1510227778-20491-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1510227778-20491-1-git-send-email-j-keerthy@ti.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Keerthy <j-keerthy@ti.com>, ssantosh@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, t-kristo@ti.com, robh+dt@kernel.org, russ.dill@ti.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/9/2017 3:42 AM, Keerthy wrote:
> In case of k2l there are 2 more banks with 16 pins each.
> Adding the node as the da-vinci driver now supports multiple
> banks.
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
> 
> This is based on linux-next branch. Boot tested on keystone-k2l-evm.
> 
Will pick this up Keerthy !!

Regards,
Santosh
