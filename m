From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v1 09/12] usb: dwc3: Registering a role switch in the DRD
 code.
Date: Mon, 3 Dec 2018 14:43:25 +0200
Message-ID: <20181203124325.GF24338@kuha.fi.intel.com>
References: <20181203034515.91412-1-chenyu56@huawei.com>
 <20181203034515.91412-10-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181203034515.91412-10-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yu Chen <chenyu56@huawei.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 03, 2018 at 11:45:12AM +0800, Yu Chen wrote:
> The Type-C drivers use USB role switch API to inform the
> system about the negotiated data role, so registering a role
> switch in the DRD code in order to support platforms with
> USB Type-C connectors.
> 
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Yu Chen <chenyu56@huawei.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> --
> v0:
> The patch is provided by Heikki Krogerus. I modified and test it
> on Hikey960 platform.

Either make me as the original author by adding a "from" line with my
address, or just use that "Suggested-by" tag with this patch as well.


thanks,

-- 
heikki
