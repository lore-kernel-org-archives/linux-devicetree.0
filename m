From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of: add managed version of of_iomap()
Date: Mon, 15 Apr 2013 11:02:28 +0100
Message-ID: <20130415100228.B4FED3E0AA8@localhost>
References: <1364133493-25262-1-git-send-email-lkundrak@v3.sk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1364133493-25262-1-git-send-email-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

On Sun, 24 Mar 2013 14:58:13 +0100, Lubomir Rintel <lkundrak@v3.sk> wrote:
> This introduces a routine devm_of_iomap(), which acts exactly like of_iomap()
> apart from that managed deivce resource subsystem takes care of reclaiming the
> resources wherever appropriate.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: devicetree-discuss@lists.ozlabs.org
> Cc: Guenter Roeck <linux@roeck-us.net>
> Reference: http://lists.infradead.org/pipermail/linux-rpi-kernel/2013-March/000461.html

Hi Lubomir,

Do you have a user for this feature that is posted yet?

g.
