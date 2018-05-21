From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 5/7] net: dsa: qca8k: Allow overwriting CPU port
 setting
Date: Mon, 21 May 2018 16:46:32 +0200
Message-ID: <20180521144632.GD8077@lunn.ch>
References: <1526909293-56377-1-git-send-email-michal.vokac@ysoft.com>
 <1526909293-56377-6-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1526909293-56377-6-git-send-email-michal.vokac@ysoft.com>
Sender: netdev-owner@vger.kernel.org
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <vokac.m@gmail.com>
Cc: netdev@vger.kernel.org, michal.vokac@ysoft.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

On Mon, May 21, 2018 at 03:28:11PM +0200, Michal Vokáč wrote:
> Implement adjust_link function that allows to overwrite default CPU port
> setting using fixed-link device tree subnode.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
