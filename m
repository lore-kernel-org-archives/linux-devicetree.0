From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 03/19] fdt: Add function to look up a
 phandle's register address
Date: Thu, 14 Jun 2012 17:17:09 -0600
Message-ID: <4FDA70F5.1030303@wwwdotorg.org>
References: <1339604395-6621-1-git-send-email-sjg@chromium.org>
	<1339604395-6621-4-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1339604395-6621-4-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 06/13/2012 10:19 AM, Simon Glass wrote:
> This is a commonly-used requirement, so add a function to support it
> easily.

Uggh. Why would this ever be needed; shouldn't the driver for the node
referenced by the phandle fully control its own registers; why would any
other driver randomly trample on them?
