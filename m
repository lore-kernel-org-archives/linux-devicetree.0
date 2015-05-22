From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v10 0/4] edac: Add APM X-Gene SoC EDAC driver
Date: Fri, 22 May 2015 10:24:59 +0200
Message-ID: <2131612.4Ote0OTURi@wuerfel>
References: <1431991481-25684-1-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1431991481-25684-1-git-send-email-lho@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Loc Ho <lho@apm.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ijc+devicetree@hellion.org.uk, jcm@redhat.com, mchehab@osg.samsung.com, patches@apm.com, robh+dt@kernel.org, bp@alien8.de, dougthompson@xmission.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 18 May 2015 17:24:36 Loc Ho wrote:
> This patch adds support for the APM X-Gene SoC EDAC driver for DT.
> 
> v10:
> * Move regmap for CSW, MCBA, MCBB, and efuse to top driver node and add
>   accessor support functions
> * Change retrieval OF address proerty for subnode to use of_address_to_resource
> * Add COMPILE_TEST to Kconfig for EDAC_XGENE
> * Update DT binding documentation and DT node accordingly
> * Remove DT node naming and number from nodes
> 

Looks good to me. When you address my last comments, please add

Acked-by: Arnd Bergmann <arnd@arndb.de>

	Arnd
