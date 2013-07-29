Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-ye0-f170.google.com ([209.85.213.170]:46132 "EHLO
	mail-ye0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752899Ab3G2QQP (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 29 Jul 2013 12:16:15 -0400
Date: Mon, 29 Jul 2013 12:15:37 -0400
From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] pata_imx: expose module alias for loading from
 device-tree
Message-ID: <20130729161537.GE22605@mtj.dyndns.org>
References: <1375083518-14899-1-git-send-email-ndevos@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375083518-14899-1-git-send-email-ndevos@redhat.com>
Sender: devicetree-owner@vger.kernel.org
To: Niels de Vos <ndevos@redhat.com>
Cc: devicetree@vger.kernel.org, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 29, 2013 at 09:38:38AM +0200, Niels de Vos wrote:
> Enable auto loading by udev when pata_imx is compiled as a module.
> 
> Signed-off-by: Niels de Vos <ndevos@redhat.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>

Applied to libata/for-3.11-fixes.

Thanks.

-- 
tejun
