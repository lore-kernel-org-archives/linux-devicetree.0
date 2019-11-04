Return-Path: <SRS0=deyM=Y4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99F7CA9EC9
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 21:31:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C75E20869
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 21:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572903116;
	bh=MFKsIN+2vYcFpY8HqPPPk7txVYXShGTWhxpF3yC4U/M=;
	h=In-Reply-To:References:Cc:Subject:From:To:Date:List-ID:From;
	b=Zj49ch15IXomqYLQJMlmOe+Qb+jfzvu7CyxqVE7ExT0omaRUKWUVWDfcrUJD3MYSP
	 q/7Q9hGoNgFHwm704BXEzEKeAQm/v5QwNrz9Zv+tmbxyA05HvDkKzaYZ2/+mcb9Rd5
	 glZN6ftavKev2M+zBp36y8N5eATYUnbuC3msXrE4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729651AbfKDVb4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 Nov 2019 16:31:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:60932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728741AbfKDVb4 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 4 Nov 2019 16:31:56 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6014120663;
        Mon,  4 Nov 2019 21:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572903115;
        bh=MFKsIN+2vYcFpY8HqPPPk7txVYXShGTWhxpF3yC4U/M=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=HES6oZ4uVAPlXOx1qTI8N6LwM4Wp+ouHRxWYhR+R7E/hqJRZszbR2rEiAW9dR6u33
         FqU/7Jzx3ZFngsvSD4+QAXRAYpjcU1DCZHDgQUSQ6glvZuoi9IHb1mZdQktvHQDDqI
         IDV1SrXR68+5aJxW1maEC0If2/cMAuO1mhpjlf3U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191025124529.17829-1-geert+renesas@glider.be>
References: <20191025124529.17829-1-geert+renesas@glider.be>
Cc:     devicetree-spec@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH devicetree-specification] Nexus: Fix double "one"
From:   Stephen Boyd <sboyd@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 04 Nov 2019 13:31:54 -0800
Message-Id: <20191104213155.6014120663@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Geert Uytterhoeven (2019-10-25 05:45:29)
> The first "one" should be "on".
>=20
> Fixes: 32c96cd64dd24e34 ("Document nexus nodes/specifier remapping")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

