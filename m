From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH 0/7] MIPS: Move device-tree files to a common location
Date: Mon, 25 Aug 2014 16:49:43 +0200
Message-ID: <20140825144943.GE25892@linux-mips.org>
References: <1408651466-8334-1-git-send-email-abrestic@chromium.org>
 <20140823161456.GA2758@localhost>
 <CAL_JsqLGdZRFXni0Y5Loij3FVfw8RzaizNaRA+_hccXz0opkKw@mail.gmail.com>
 <2336240.173zr5MfQE@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Received: from localhost.localdomain ([127.0.0.1]:53215 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27006749AbaHYOtxF1Ub5 (ORCPT <rfc822;devicetree@vger.kernel.org>
        + 1 other); Mon, 25 Aug 2014 16:49:53 +0200
Content-Disposition: inline
In-Reply-To: <2336240.173zr5MfQE@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robherring2@gmail.com>, Olof Johansson <olof@lixom.net>, Andrew Bresticker <abrestic@chromium.org>, Florian Fainelli <f.fainelli@gmail.com>, Kumar Gala <galak@codeaurora.org>, David Daney <david.daney@cavium.com>, Rob Herring <robh+dt@kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, Qais Yousef <qais.yousef@imgtec.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, John Crispin <blogic@openwrt.org>, Mark Rutland <mark.rutland@arm.com>, Jayachandran C <jchandra@broadcom.com>, Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

There have been no forcing arguments for or against acceptance of this
patch series but given that many other architectures organize their
DTS files in an arch/<ARCH>/boot/dts/ directory I think MIPS should
follow that example.

  Ralf
