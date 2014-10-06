From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Regulator: Questions about constraints
Date: Mon, 6 Oct 2014 19:48:55 +0200 (CEST)
Message-ID: <1486422791.288728.1412617735622.JavaMail.open-xchange@oxbaltgw54.schlund.de>
Reply-To: Stefan Wahren <stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

currently i'm porting a regulator driver and i've two question about regulator
constraints and DT binding:

Should a regulator driver rely on DT regulator constraints or not?

In case the constraints are not set by DT, what is the recommend behavior of a
regulator driver?

Best regards

Stefan
